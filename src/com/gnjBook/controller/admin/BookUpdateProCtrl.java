package com.gnjBook.controller.admin;

import com.gnjBook.dto.Member;
import com.gnjBook.dto.Product;
import com.gnjBook.model.MemberDAO;
import com.gnjBook.model.ProductDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

@WebServlet("/BookUpdatePro.do")
public class BookUpdateProCtrl extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  String msg = "";
  ServletContext application = request.getServletContext();
  String home = application.getContextPath();

        try {
                String saveDirectory = application.getRealPath("/storage");
                int maxSize = 1024*1024*10;
                String encoding = "UTF-8";

                MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, encoding, new DefaultFileRenamePolicy());
                Product uppro = new Product();
                uppro.setCategoryId(mr.getParameter("category"));
            System.out.println(mr.getParameter("category"));

                uppro.setPrice(Integer.parseInt(mr.getParameter("price")));
            System.out.println(mr.getParameter("price"));

                uppro.setTitle(mr.getParameter("title"));
            System.out.println(mr.getParameter("title"));

                uppro.setContent(mr.getParameter("content"));
            System.out.println(mr.getParameter("content"));

                uppro.setProNo(Integer.parseInt(mr.getParameter("proNo")));
            System.out.println(mr.getParameter("proNo"));




                Enumeration files = mr.getFileNames();

                String item = (String) files.nextElement();
                String oriFile = mr.getOriginalFileName(item);
                String fileName = mr.getFilesystemName(item);


                File upfile = null;
                upfile = mr.getFile(item); //실제 업로드

                if(upfile.exists()){
                    msg = "파일 업로드 성공";
                    System.out.println("파일 업로드 성공");
                } else {
                    msg = "파일 업로드 실패";
                    System.out.println("파일 업로드 실패");
                }

                uppro.setImg(upfile.getName());


                request.setAttribute("msg", msg);


            ProductDAO dao = new ProductDAO();
            int cnt = dao.updateProduct(uppro);

            PrintWriter out = response.getWriter();

            response.sendRedirect(home+"/BookListAdmin.do");



                } catch(Exception e){
                System.out.println(e.getMessage());
              }

            }

          }