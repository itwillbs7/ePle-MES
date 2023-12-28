package com.itwillbs.controller;

import com.itwillbs.domain.LineVO;
import com.itwillbs.service.LineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/mes/line")
public class LineController {

    @Autowired
    private LineService lineService;

    // 라인 목록 조회
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String listLines(Model model) {
        model.addAttribute("lines", lineService.getAllLines());
        return "/mes/line/list";
    }

    // 라인 상세 조회
    @RequestMapping(value = "/view/{lineId}", method = RequestMethod.GET)
    public String viewLine(@PathVariable("lineId") int lineId, Model model) {
        LineVO line = lineService.getLineById(lineId);
        model.addAttribute("line", line);
        return "/mes/line/view";
    }

    // 라인 추가 폼
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addLineForm() {
        return "/mes/line/add";
    }

    // 라인 추가 처리
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addLine(@ModelAttribute LineVO line, Model model) {
        lineService.addLine(line);
        model.addAttribute("message", "라인이 추가되었습니다.");
        return "redirect:/mes/line/list";
    }

    // 라인 수정 폼
    @RequestMapping(value = "/modify/{lineId}", method = RequestMethod.GET)
    public String modifyLineForm(@PathVariable("lineId") int lineId, Model model) {
        LineVO line = lineService.getLineById(lineId);
        model.addAttribute("line", line);
        return "/mes/line/modify";
    }

    // 라인 수정 처리
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyLine(@ModelAttribute LineVO line, Model model) {
        lineService.modifyLine(line);
        model.addAttribute("message", "라인이 수정되었습니다.");
        return "redirect:/mes/line/list";
    }

    // 라인 삭제 처리
    @RequestMapping(value = "/delete/{lineId}", method = RequestMethod.POST)
    public String deleteLine(@PathVariable("lineId") int lineId, Model model) {
        lineService.deleteLine(lineId);
        model.addAttribute("message", "라인이 삭제되었습니다.");
        return "redirect:/mes/line/list";
    }
}
