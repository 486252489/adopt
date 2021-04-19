package club.controller;

import club.pojo.Blog;
import club.pojo.News;
import club.service.BlogService;
import club.service.NewsService;
import club.util.Message;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

@Controller
@RequestMapping("/news")
public class NewsController {
    @Resource
    private NewsService service;
    @RequestMapping("/news")
    @ResponseBody
    public Message news(String actionTime, @RequestParam("pn") Integer pageNum){
        if(pageNum == null){
            pageNum = 1;
        }
        System.out.println(actionTime);
        PageInfo<News> allBlog = service.findAllNews(actionTime, pageNum, 3);
        return Message.success().add("pageInfo",allBlog);
    }

    @RequestMapping("/create")
    @ResponseBody
    public Message creat(News news, MultipartFile file){
        String pic = FileLoad.uploadPetPic(file);
        news.setPic(pic);
        int i = service.add(news);
        if(i > 0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("/update")
    @ResponseBody
    public Message update(News news, MultipartFile file){
        String pic = FileLoad.uploadPetPic(file);
        news.setPic(pic);
        int i = service.updateNews(news);
        if(i > 0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Message delete(Integer id){
        int i = service.del(id);
        if(i > 0){
            return Message.success();
        }else {
            return Message.fail();
        }
    }

    @RequestMapping("/findById")
    @ResponseBody
    public Message findById(Integer id){
        News news = service.findById(id);
        return Message.success().add("news", news);
    }
}
