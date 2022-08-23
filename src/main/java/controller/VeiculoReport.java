package controller;

import java.sql.Connection;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import conexao.Conexao;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRPdfExporter;




@WebServlet("/VeiculoReport")
public class VeiculoReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	Connection con = Conexao.getConnection();
	
	String src = "/home/daniel_souza/workspace-2022/VeiculosServlet/Veiculos.jasper";
	
	JasperPrint jasperPrint = null;
	
	try {
	
	jasperPrint = JasperFillManager.fillReport(src, null, con);
	
	} catch (JRException ex) {
		System.out.println(ex);
	}
	
	//JasperViewer view = new JasperViewer(jasperPrint, false);
	
	//view.setVisible(true);
	
	FileOutputStream saida = new FileOutputStream("/home/daniel_souza/workspace-2022/VeiculosServlet/Veiculos.pdf");
	
	JRExporter exporter = new JRPdfExporter();
	exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
    exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, saida);
	
    try {
		exporter.exportReport();
	} catch (JRException e) {
		System.out.println(e);
	}
    
	response.sendRedirect("VeiculoListAndCreate");
	
	}
}
