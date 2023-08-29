package com.gnjBook.controller.admin;

import com.gnjBook.dto.Fileboard;
import com.gnjBook.model.FileboardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/FileboardAddPro.do") // 사용자가 보는 이름
public class FileboardAddProCtrl extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // addNotice.jsp의 form에서 post method로 보내므로, doPost로 받아야 함
        request.setAttribute("msg", "학습자료를 추가합니다.");
        String path = request.getContextPath();

        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Fileboard new_fileboard = new Fileboard();
        new_fileboard.setTitle(title);
        new_fileboard.setContent(content);

        FileboardDAO dao = new FileboardDAO();
        int cnt = dao.addFileboard(new_fileboard);

        if(cnt>0){
            System.out.println("성공적으로 추가되었습니다.");
            response.sendRedirect(path+"/FileboardListAdmin.do");
        } else{
            System.out.println("오류로 인해 제대로 처리되지 않았습니다.");
            PrintWriter out = response.getWriter();
            out.println("<script>history.go(-1);</script>");
        }
    }
}