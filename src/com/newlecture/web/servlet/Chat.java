package com.newlecture.web.servlet;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Chat
 */
@WebServlet("/chat")
public class Chat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("image/jpeg");
		
		//BufferedImage image = new BufferedImage(1000, 1000, BufferedImage.TYPE_INT_BGR);
		
		String url ="images/photo/bg1.jpg";
		ServletContext context = request.getServletContext();
		
		String path = context.getRealPath(url);
		
		BufferedImage image = ImageIO.read(new File(path));
		
/*		LoadImageApplet loadImage = new LoadImageApplet();
		
		loadImage.init();*/
		Graphics g = image.createGraphics();
		/*loadImage.paint(g);*/
		//g.setColor(Color.WHITE);
		//g.fillRect(0, 0, 1000, 1000);
		
		int offset = 100;

		int originX = offset;
		int originY = 1024 - offset;
		
		String arrowUp = "▲";
		String arrowRight = "▶";
		
		String[] value1 = { "2", "4", "6", "8", "10" };
		String[] value2 = { "20", "40", "60", "80", "100" };
		
		g.setColor(Color.blue);
		g.drawLine(offset, 1024 - offset + 20 , offset, offset);//세로축
		g.drawString(arrowUp, offset -5, offset);//왼쪽 위 화살표
		g.drawLine(offset - 20, 1024 - offset, 1024 - offset, 1024 - offset );//가로축
		g.drawString(arrowRight, 1024 - offset, 1024 - offset +5);//오른쪽 하단 화살표
		
		g.setColor(Color.red);
		g.drawLine(1024 - offset, 1024 - offset + 20, 1024 - offset, offset);//
		g.drawString(arrowUp,  1024 - offset-5, offset);//오른쪽 위 화살표

		for (int y = 0; y < 5; y++) {
			g.setColor(Color.black);
			g.drawString(value1[y], originX - 30, originY - 150 + (-150 * y));
			g.drawString(value2[y], 1024 - offset + 30, originY - 150 + (-150 * y));
			
			for (int x = 0; x < 83; x++) {
				g.setColor(Color.green);
				g.drawOval(originX + (x * 10), originY - 150 + (-150 * y), 4, 4);
			}
		}

		String text1 = "인원(명)";
		String text2 = "누적상대도수(%)";
		//인원 명, 누적상대도수
		g.setColor(Color.black);
		g.drawString(text1, offset, offset - 20);

		g.drawString(text2, 1024 - offset, offset - 20);
		
		OutputStream os = response.getOutputStream();
		
		ImageIO.write(image, "jpg", os);
		
	}

}
