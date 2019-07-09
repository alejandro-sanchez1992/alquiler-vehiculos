/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Logica;

import Datos.Conexion;

public class Vehiculo {
    private String marca;
    private String modelo;
    private String color;
    private float kilometraje;
    private int dias;
    private int valor;
    private String error;

    public Vehiculo() {
        valor = 0;
    }
    
    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public float getKilometraje() {
        return kilometraje;
    }

    public void setKilometraje(float kilometraje) {
        this.kilometraje = kilometraje;
    }

    public int getDias() {
        return dias;
    }

    public void setDias(int dias) {
        this.dias = dias;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(int valor) {
        this.valor = valor;
    }
    
    
    public boolean insertar(){
        
        boolean Respuesta;
        
        Conexion co = new Conexion();
        
        co.abrirConexion();
        Respuesta = co.InsertarBD(marca, modelo,color,kilometraje,dias);
        co.cerrarConexion();
        
        return Respuesta;
        
    }
    public boolean Validar(){
        if(getKilometraje()<=0){
            String e;
            e="Los valores de los kilometros no pueden ser inferiores o iguales a cero";
            setError(e);
            
            return false;
        }else{
            
            return true;
        }
    }
    public void Calcular(){
        if(kilometraje>0&&kilometraje<=50000){
            valor=150000*getDias();
        }
        if(kilometraje>50000&&kilometraje<=100000){
            valor=80000*getDias();
        }
        if(kilometraje>10000000){
            valor=50000*getDias();
        }
        setValor(valor);
    }
    
}