package com.example.another_back.controller;

import com.example.another_back.response.Response;
import com.example.another_back.service.VersusService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/versus")
@Slf4j
public class VersusController {

    private final VersusService versusService;

    /**
     * HDFS에서 경쟁 데이터 받아오기
     *
     * @param runningId
     * @return JSONArray
     */
    @GetMapping("/{runningId}")
    public ResponseEntity getVersusData(@PathVariable String runningId){
        JSONArray versusData = versusService.getVersusData(runningId);
        return Response.success(HttpStatus.OK, versusData);
    }

    /**
     * Exception 처리
     *
     * @param e
     * @return Exception
     */
    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity IllegalArgumentException(IllegalArgumentException e){
        return Response.fail(HttpStatus.BAD_REQUEST, e.getMessage());
    }
}
