package services;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Yang Qun
 *
 */
@Controller
@RequestMapping("/post")
public class ToAddTopic {
	@RequestMapping("/toaddtopic")
	public String go(HttpServletResponse response,HttpServletRequest request) {
		try {
			response.sendRedirect(request.getContextPath()+"/fly/html/jie/add.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "jie/add";
	}

}
