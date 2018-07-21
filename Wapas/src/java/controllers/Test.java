/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.util.ArrayList;
/**
 *
 * @author Jade
 */
public class Test {
    
    public static void main(String[]args){
        
        Cita cita = new Cita();
        ArrayList<Cita> citas = cita.obtenerCitas(1);
        
        for (int i = 0; i < citas.size(); i++) {
            System.out.println(citas.get(i).getFecha());
        }
        
    }
    
}
