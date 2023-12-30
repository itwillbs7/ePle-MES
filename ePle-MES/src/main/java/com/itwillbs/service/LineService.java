package com.itwillbs.service;

import com.itwillbs.domain.LineVO;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LineService {

    // 가정: 간단한 메모리 기반 데이터 저장
    private static List<LineVO> lineList = new ArrayList<>();
    private static int nextLineId = 1;

    // 라인 목록 조회
    public List<LineVO> getAllLines() {
        return lineList;
    }

    // 라인 상세 조회
    public LineVO getLineById(int lineId) {
        for (LineVO line : lineList) {
            if (line.getLineId() == lineId) {
                return line;
            }
        }
        return null;
    }

    // 라인 추가
    public void addLine(LineVO line) {
        line.setLineId(nextLineId++);
        lineList.add(line);
    }

    // 라인 수정
    public void modifyLine(LineVO line) {
        for (int i = 0; i < lineList.size(); i++) {
            if (lineList.get(i).getLineId() == line.getLineId()) {
                lineList.set(i, line);
                break;
            }
        }
    }

    // 라인 삭제
    public void deleteLine(int lineId) {
        lineList.removeIf(line -> line.getLineId() == lineId);
    }
}
