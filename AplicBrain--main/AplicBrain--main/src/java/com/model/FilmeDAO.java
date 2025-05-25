package com.model;

import com.bean.Filme;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Raissa
 */

public class FilmeDAO {

    public void inserir(Filme f) throws Exception {
        String sql = "INSERT INTO filmes (nome_filme, genero, nota, descricao, usuario_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = ConexaoBD.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, f.getTitulo());
            stmt.setString(2, f.getGenero());
            stmt.setDouble(3, f.getNota());
            stmt.setString(4, f.getDescricao());
            stmt.setInt(5, f.getUsuarioId());
            stmt.executeUpdate();
        }
    }

    public void atualizar(Filme f) throws Exception {
        String sql = "UPDATE filmes SET nome_filme=?, genero=?, nota=?, descricao=? WHERE id_filme=?";
        try (Connection conn = ConexaoBD.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, f.getTitulo());
            stmt.setString(2, f.getGenero());
            stmt.setDouble(3, f.getNota());
            stmt.setString(4, f.getDescricao());
            stmt.setInt(5, f.getId());
            stmt.executeUpdate();
        }
    }

    public void excluir(int id) throws Exception {
        String sql = "DELETE FROM filmes WHERE id_filme=?";
        try (Connection conn = ConexaoBD.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public Filme buscarPorId(int id) throws Exception {
        String sql = "SELECT * FROM filmes WHERE id_filme=?";
        try (Connection conn = ConexaoBD.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Filme f = new Filme();
                f.setId(rs.getInt("id_filme"));
                f.setTitulo(rs.getString("nome_filme"));
                f.setGenero(rs.getString("genero"));
                f.setNota(rs.getDouble("nota"));
                f.setDescricao(rs.getString("descricao"));
                f.setUsuarioId(rs.getInt("usuario_id"));
                return f;
            }
        }
        return null;
    }

    public List<Filme> listar() throws Exception {
        List<Filme> lista = new ArrayList<>();
        String sql = """
            SELECT f.*, u.nome AS nome_usuario 
            FROM filmes f
            LEFT JOIN usuarios u ON f.usuario_id = u.id_usuario
            ORDER BY f.nome_filme
        """;

        try (Connection conn = ConexaoBD.conectar();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Filme f = new Filme();
                f.setId(rs.getInt("id_filme"));
                f.setTitulo(rs.getString("nome_filme"));
                f.setGenero(rs.getString("genero"));
                f.setNota(rs.getDouble("nota"));
                f.setDescricao(rs.getString("descricao"));
                f.setUsuarioId(rs.getInt("usuario_id"));
                f.setNomeUsuario(rs.getString("nome_usuario")); // para exibir quem sugeriu
                lista.add(f);
            }
        }
        return lista;
    }
}
