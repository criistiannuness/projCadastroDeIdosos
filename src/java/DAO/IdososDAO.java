package DAO;

import DTO.Idosos;
import conexaoBD.ConexaoBD;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

public class IdososDAO {
    
    private Connection conexao;
    private PreparedStatement pstm;
    private ResultSet resultado;
    private ArrayList<Idosos> listaDeIdosos = new ArrayList<>();
    
    public void cadastrarIdosos(Idosos objIdosos) throws ClassNotFoundException {
        String sql = "insert into tb_idosos(nome,telefone,email,senha)  values(?,?,?)";
        this.conexao = new ConexaoBD().getConexao();
        
        try {
            pstm = conexao.prepareStatement(sql);
            pstm.setString(1, objIdosos.getNome());
            pstm.setString(2, objIdosos.getTelefone());
            pstm.setString(3, objIdosos.getEmail());
            
            pstm.execute();
            pstm.close();
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "erro " + e);
        }
        
    }
    
    public ArrayList<Idosos> listarTodosOsIdosos() throws ClassNotFoundException {
        String sql = "SELECT * FROM tb_idosos";
        this.conexao = new ConexaoBD().getConexao();
        
        try {
            this.pstm = this.conexao.prepareStatement(sql);
            this.resultado = this.pstm.executeQuery(sql);
            
            while (this.resultado.next()) {
                Idosos objIdosos = new Idosos();
                objIdosos.setId(this.resultado.getInt("pkididosos"));
                objIdosos.setNome(this.resultado.getString("nome"));
                objIdosos.setTelefone(this.resultado.getString("telefone"));
                objIdosos.setEmail(this.resultado.getString("email"));
                
                this.listaDeIdosos.add(objIdosos);
            }
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "erro" + e);
        }
        return this.listaDeIdosos;
    }
    
    public void alterarContato(Idosos objIdosos) throws ClassNotFoundException {
        String sql = "update tb_idosos "
                + "set nome = ?, telefone = ?, email = ?"
                + " where pkid_idosos = ?";
        this.conexao = new ConexaoBD().getConexao();
        
        try {
            this.pstm = this.conexao.prepareStatement(sql);
            this.pstm.setString(1, objIdosos.getNome());
            this.pstm.setString(2, objIdosos.getTelefone());
            this.pstm.setString(3, objIdosos.getEmail());
            this.pstm.setInt(4, objIdosos.getId());
            
            this.pstm.execute();
            this.pstm.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro 404  ===> " + e);
        }
    }
    
    public void excluirIdosos(Idosos objIdosos) throws ClassNotFoundException {
        
        String sql = "delete from tb_idosos where pkididosos = ?";
        this.conexao = new ConexaoBD().getConexao();
        
        try {
            this.pstm = this.conexao.prepareStatement(sql);
            this.pstm.setInt(1, objIdosos.getId());
            
            this.pstm.execute();
            this.pstm.close();
            
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro 404 ===> " + e);
        }
    }
    
    public ArrayList<Idosos> pesquisarIdososPorNome(String nome) throws ClassNotFoundException {
        String sql = "SELECT * FROM tb_idosos where nome = ?";
        this.conexao = new ConexaoBD().getConexao();
        
        try {
            this.pstm = this.conexao.prepareStatement(sql);
            this.resultado = this.pstm.executeQuery(sql);
            
            while (this.resultado.next()) {
                Idosos objIdosos = new Idosos();
                
                objIdosos.setId(this.resultado.getInt("pkididosos"));
                objIdosos.setNome(this.resultado.getString("nome"));
                objIdosos.setTelefone(this.resultado.getString("telefone"));
                objIdosos.setEmail(this.resultado.getString("email"));
                
                if (resultado.getString("nome").equalsIgnoreCase(nome)) {
                    this.listaDeIdosos.add(objIdosos);
                }
            }
        } catch (SQLException e ) {
            JOptionPane.showMessageDialog(null, "Erro 500 ===> " + e);
        }
        return this.listaDeIdosos;
    }
}
