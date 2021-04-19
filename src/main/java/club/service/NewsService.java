package club.service;

import club.pojo.Blog;
import club.pojo.News;
import com.github.pagehelper.PageInfo;

public interface NewsService {
    PageInfo<News> findAllNews(String cdate,Integer pageNum,Integer pageSize);
    int add(News news);
    News findById(Integer id);
    int updateNews(News news);
    int del(Integer id);
    PageInfo<News> news(Integer pageNum, Integer pageSize);
}
