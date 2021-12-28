package etl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class ETL {

	private String creETL[], base, port, usuario, contra;
	private int semanas, meses[], diaAno, dia, mes, ano;
	
	private Connection getCreaConnec(String baseDatos, String puerto, String user, String password) {
		Connection estableceConnection = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url = "jdbc:sqlserver://localhost:1433;databaseName=victimasJULIO2021;integratedSecurity=true;";
			estableceConnection = DriverManager.getConnection(url);
			System.out.println("SE CREO CON EXITO CONECT");
		} catch (ClassNotFoundException e) {
			System.out.println("ERROR AL CREAR CONECT");
			e.printStackTrace();
			estableceConnection = null;
		}
		catch (SQLException e) {
			System.out.println("ERROR AL CREAR CONECT");
			estableceConnection = null;
		}
		return estableceConnection;
	}
	private Statement getCreaStat(Connection utiliza)
	{
		Statement nuevoStatement = null;
		if( utiliza != null )
			try {
				nuevoStatement = utiliza.createStatement();
				System.out.println("SE CREO CON EXITO STATEMENT");
			} catch (Exception e) {
				nuevoStatement = null;
				System.out.println("ERROR AL CREAR STATEMENT");
			}
		else
		{
			utiliza = null;
			System.out.println("ERROR AL CREAR STATEMENT");
		}
		return nuevoStatement;
	}
	private ResultSet getCreaRes(Statement usa, String consulta) {
		ResultSet resultado = null;
		if(usa != null)
			try {
				resultado = usa.executeQuery(consulta);
				System.out.println("SE CREO CON EXITO RESULTSET");
			} catch (Exception e) {
				resultado = null;
				System.out.println("ERROR AL CREAR RESULTSET");
			}
		else {
			resultado = null;
			System.out.println("ERROR AL CREAR RESULTSET");
		}
		return resultado;
	}
	private void recorreMeses()
	{
		//ARREGLO ENCARGADO DE RECORRER DESDE EL MES DE ENERO HASTA UNO ANTES DE LA FECHA DE CADA REGSITRO
		
		for(int i=0; i<mes-1; i++)
			diaAno += meses[i];
		diaAno += dia;
	}
	private void calculaEneroFebrero()
	{
		//SENTENCIA PARA CALCULAR LOS CASOS DE ENERO Y FEBRERO SOLAMENTE
		if( mes==2 )
			diaAno += meses[0]+dia;
		else
			diaAno += dia;
	}
	protected void calculaSemanas()
	{
		//IF ENCARGADO DE CALCULAR LOS AÑOS BISIESTROS DEL PERIODO DE 1950 A LA FECHA DE CADA REGISTRO -1 PARA SUMAR UN DIA POR AÑO ENCONTRADO
		if( ano > 1952 )
				semanas = (int)(((ano -1)-1952)/4)+1;
		else
			semanas = (int)((ano -1)-1952)/4;
		
		//CALCULO DE LA CANTIDAD DE DIAS QUE EXISTE ENTRE EL PERIODO DE 1950 Y LA FECHA DE CADA REGISTRO 
		semanas += (int)(((ano-1)-1950)*365)+365;

		//SENTENCIA ENCARGADA DE CALCULAR LOS DIAS EN LOS MESES Y DIAS DE LA FECHA DE CADA DE RESGISTRO
		if( mes>2 && ano>1952 )
		{
			if( ((ano-1952)%4)==0 )
				diaAno += 1;
			recorreMeses();
		}
		else if( mes<=2 &&ano>1952 )
			calculaEneroFebrero();
		else
			if( ano==1952 && mes>2 )
			{
				diaAno += 1;
				recorreMeses();
			}
			else if( ano==1952 && mes<=2 )
				calculaEneroFebrero();
			else if ( ano<1952 && mes>2 )
				recorreMeses();
			else
				calculaEneroFebrero();
		semanas += diaAno;
		semanas = (int)(semanas/7);
	}
	public ETL() {
		
		semanas = 0;
		diaAno = 0;
		//arreglo de cada mes de año con su respectivo cantidad de dias
		meses = new int[12];
		meses[0] = 31;//MES DE ENERO
		meses[1] = 28;//FEBRERO
		meses[2] = 31;//MARZO
		meses[3] = 30;//ABRIL
		meses[4] = 31;//MAYO
		meses[5] = 30;//JUNIO
		meses[6] = 31;//JULIO
		meses[7] = 31;//AGOSTO
		meses[8] = 30;//SEPTIEMBRE
		meses[9] = 31;//OCTUBRE
		meses[10] = 30;//NOVIEMBRE
		meses[11] = 31;//DICIEMBRE
		
		//PETICION DE DATOS DESDE TECLADO
		
		Scanner ingresa = new Scanner(System.in);
		
		//ARREGLO DE CADENAS PARA GENERAR QUERYS EN SQL SERVER
		String tempString = null;
		creETL = new String[5];
		creETL[0] = "alter table julio2021 add semanaHecho float;";
		creETL[1] = "alter table julio2021 add diaHecho int;";
		creETL[2] = "select idCarpeta, FechaHecho from julio2021;";
		//Connection nuevoCon = getCreaConnec("victimasJULIO2021", "1433", "SA", "Dailex9807+");
		Connection nuevoCon = getCreaConnec(base, port, usuario, contra);
		Statement nuevoSta = getCreaStat(nuevoCon);
		Statement nuevoSta2 = getCreaStat(nuevoCon);
		ResultSet nuevoRes;
		try {
			nuevoSta.executeUpdate(creETL[0]);
			nuevoSta.executeUpdate(creETL[1]);
			nuevoRes = getCreaRes(nuevoSta, creETL[2]);
			while ( nuevoRes.next() )
			{
				tempString = nuevoRes.getString(2);
				dia = Integer.parseInt(tempString.substring(8, 10));
				mes = Integer.parseInt(tempString.substring(5, 7));
				ano = Integer.parseInt(tempString.substring(0, 4));
				calculaSemanas();
				creETL[3] = "update julio2021 SET semanaHecho ="+semanas+" where idCarpeta = "+Integer.parseInt(nuevoRes.getString(1))+";";
				creETL[4] = "update julio2021 SET diaHecho ="+dia+" where idCarpeta = "+Integer.parseInt(nuevoRes.getString(1))+";";
				nuevoSta2.addBatch(creETL[3]);
				nuevoSta2.addBatch(creETL[4]);
				nuevoSta2.executeBatch();
				creETL[3] = null;
				creETL[4] = null;
				tempString = null;
				semanas = 0;
				diaAno = 0;
				System.out.println(" EN PROCESO ESPERE UN MOMENTO POR FAVOR");
			}
			nuevoRes.close();
			nuevoSta2.close();
			nuevoSta.close();
			nuevoCon.close();
			System.out.println("TERMINO");
		} catch (Exception e) {
			System.out.println("ERROR AL INTENTAR IMPRIMIR EL QUERY");
		}
	}
	public static void main (String arg[])
	{
		ETL nuevo = new ETL();
	}
}
