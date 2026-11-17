package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import entidades.Proyecto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ProyectoServlet
 */
@WebServlet("/ProyectoServlet")
public class ProyectoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private List<Proyecto> listaProyectos = new ArrayList<Proyecto>();
	private int contadorId = 1;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProyectoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("proyectos", listaProyectos);

		request.getRequestDispatcher("/registro.jsp")
		       .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String descripcion = request.getParameter("descripcion");
		String fechaInicio = request.getParameter("fechainicio");
		String fechaFin = request.getParameter("fechafin");
		String asesorTecnico = request.getParameter("asesortecnico");
		String presupuesto = request.getParameter("presupuesto");
		
		Proyecto proyecto = new Proyecto(String.valueOf(contadorId++),nombre,descripcion, fechaInicio, fechaFin,asesorTecnico, presupuesto);
		listaProyectos.add(proyecto);
		
		response.sendRedirect(request.getContextPath() + "/ProyectoServlet");
	}

}
