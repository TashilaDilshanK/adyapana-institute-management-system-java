
package model;

import java.util.HashMap;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;

public class Invoice {
    
    public static void main(String[] args) {
       
        try {
            String filepath = "src//report//adyapana.jrxml";
            JasperReport jr = JasperCompileManager.compileReport(filepath);
            
            HashMap parameters = new HashMap();
            parameters.put("Parameter1", "kal123");
            
            JREmptyDataSource dataSource = new JREmptyDataSource();
            JasperPrint jp = JasperFillManager.fillReport(jr, parameters,dataSource);
            
            JasperViewer.viewReport(jp);
            
           
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
}
