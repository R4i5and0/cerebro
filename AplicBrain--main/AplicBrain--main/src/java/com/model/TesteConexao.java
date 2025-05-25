/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.model;

/**
 *
 * @author Raissa
 */
import java.sql.Connection;

public class TesteConexao {

    public static void main(String[] args) {
        try {
            Connection conn = ConexaoBD.conectar();
            System.out.println("✅ Conexão com o banco de dados estabelecida com sucesso!");
            conn.close();
        } catch (Exception e) {
            System.out.println("❌ Erro ao conectar com o banco de dados:");
            e.printStackTrace();
        }
    }
}
