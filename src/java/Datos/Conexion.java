/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Datos;


import java.sql.*;


public class Conexion {
    
    private String baseDatos;
    private String cadenaCon;
    private String user;
    private String pass;
    
    private Connection con;
    private Statement statement;
    private ResultSet resulset;
    
    
    public Conexion(){
 
        baseDatos = "Agencia";
        user = "sa";
        pass = "12345";
        cadenaCon = "jdbc:sqlserver://localhost:1433;databaseName=Agencia";
        
        //cadenaCon = "jdbc:sqlserver://localhost:1433;databaseName=" + baseDatos +"; IntegratedSecurity=true";       
    }
    
    
    public void abrirConexion(){
        
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(cadenaCon, user, pass);
        } 
        catch(Exception ex){
            
        }
        
    }
    
    
    public String ConsultarBD(String marca){

        try{

            statement = con.createStatement();
            resulset = statement.executeQuery ("select * from Alquiler where marca = "+ marca);

            resulset.next();

            return resulset.getString(2);

        }
        catch(Exception ex){
           return null; 
        }
    }
     
     
    public boolean InsertarBD(String marca, String modelo,String color,float kilometraje, int dias){

        try{  
            int FilaGuardada;

            statement = con.createStatement();

            FilaGuardada = statement.executeUpdate("Insert into Alquiler values('" + marca +"','" + modelo +"','"+ color +"',"+ kilometraje +","+ dias +")");

            if(FilaGuardada >0){
               return true;
            }
            else{
               return false;
            }

        }catch(Exception ex){
            return false;
        }
    }
     
    public void cerrarConexion(){

        try{
           con.close();
        }
        catch(Exception e){
            
        }
    }
}