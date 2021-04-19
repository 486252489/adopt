package club.service.impl;

import club.dao.NewsMapper;
import club.pojo.News;
import club.service.NewsService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class NewsServiceImpl implements NewsService {
    @Resource
    private NewsMapper mapper;

    @Override
    public PageInfo<News> findAllNews(String actionTime, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        EntityWrapper wrapper = new EntityWrapper();
        if(actionTime != null && !"".equals(actionTime)){
            wrapper.eq("actionTime",actionTime);
        }
        List list = mapper.selectList(wrapper);
        PageInfo<News> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int add(News news) {
        return mapper.insert(news);
    }

    @Override
    public News findById(Integer id) {
        return mapper.selectById(id);
    }

    @Override
    public int updateNews(News news) {
        return mapper.updateById(news);
    }

    @Override
    public int del(Integer id) {
        return mapper.deleteById(id);
    }

    @Override
    public PageInfo<News> news(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<News> news = mapper.selectList(null);
        PageInfo<News> pageInfo = new PageInfo<News>(news, 3);
        return pageInfo;
    }
}
