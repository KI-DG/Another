package com.example.another_back.controller;

import com.example.another_back.dto.RunningResponseDto;
import com.example.another_back.dto.response.Response;
import com.example.another_back.service.FeedService;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONArray;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("api/feed")
public class FeedController {

    private final FeedService feedService;

    /**
     * 피드 리스트 기능
     *
     * @param pageable
     *
     * @return Page<RunningResponseDto>
     */
    @GetMapping
    public ResponseEntity getFeedList(Pageable pageable) {
        Page<RunningResponseDto> feedList = feedService.getFeedList(pageable);
        return Response.success(HttpStatus.OK, feedList);
    }

    /**
     * 디테일 페이지 그래프
     *
     * @param runningId
     * @return JSONArray
     */
    @GetMapping("/{runningId}")
    public ResponseEntity getOriginData(@PathVariable String runningId) {
        JSONArray response = feedService.getOringinData(runningId);
        return Response.success(HttpStatus.OK, response);
    }
}
