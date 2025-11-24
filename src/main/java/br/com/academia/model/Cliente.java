package br.com.academia.model;

public class Cliente {
	private int id;
	private String nome;
	private String telefone;
	private String plano;
	
	public Cliente() {
	}
	
	public Cliente (String nome, String telefone, String plano) {
		this.nome = nome;
		this.telefone = telefone;
		this.plano = plano;
	}
	
	public Cliente(int id, String nome, String telefone, String plano) {
        this.id = id;
        this.nome = nome;
        this.telefone = telefone;
        this.plano = plano;
    }
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getPlano() {
		return plano;
	}
	public void setPlano(String plano) {
		this.plano = plano;
	}
	
}
