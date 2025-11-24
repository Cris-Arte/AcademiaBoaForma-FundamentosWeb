package br.com.academia.dao;

import br.com.academia.model.Cliente;
import br.com.academia.model.DataBaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {
	public void addCliente(Cliente cliente) {
		String sql = "INSERT INTO clientes (nome, telefone, plano) VALUES (?,?,?)";
		try (Connection conn = DataBaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)){
			
			stmt.setString(1, cliente.getNome());
			stmt.setString(2, cliente.getTelefone());
			stmt.setString(3, cliente.getPlano());
			
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Cliente> listarClientes() {
        List<Cliente> clientes = new ArrayList<>();
        String sql = "SELECT * FROM clientes ORDER BY nome";
        
        try (Connection conn = DataBaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setPlano(rs.getString("plano"));
                clientes.add(cliente);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return clientes;
    }
	
	public void excluirCliente(int id) {
		String sql = "DELETE FROM clientes WHERE id = ?";
		
		try (Connection conn = DataBaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)){
			
			stmt.setInt(1, id);
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void atualizarCliente(Cliente cliente) {
        String sql = "UPDATE clientes SET nome = ?, telefone = ?, plano = ? WHERE id = ?";
        
        try (Connection conn = DataBaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getTelefone());
            stmt.setString(3, cliente.getPlano());
            stmt.setInt(4, cliente.getId());
            
            stmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
	}
}