package kr.ac.kopo.board.dao;


import util.ConnectionFactory;
import util.JDBCClose;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.lang.String;

/**
 * t_board 테이블의 CRUD 담당 클래스
 */
public class BoardDAO {
    /**
     * no에 해당 게시물 조회 메소드
     */
    public BoardVO selectByNo(int no) {
        StringBuilder sql = new StringBuilder();
        sql.append("select no, title, writer, content, view_cnt, reg_date ");
        sql.append("from t_board ");
        sql.append("where no = ?");
        try (
                Connection conn = new ConnectionFactory().getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setInt(1, no);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int boardNumber = rs.getInt("NO");
                String title = rs.getString("TITLE");
                String writer = rs.getString("WRITER");
                String content = rs.getString("CONTENT");
                int viewCnt = rs.getInt("VIEW_CNT");
                String regDate = rs.getString("REG_DATE");
                BoardVO board = new BoardVO(boardNumber, title, writer, content, viewCnt, regDate);
                return board;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 전체게시글 조회 메소드
     */
    public List<BoardVO> selectAll() {
        List<BoardVO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = new ConnectionFactory().getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("select no, title, writer, to_char(reg_date, 'yyyy-mm-dd') as reg_date");
            sql.append("  from t_board");
            sql.append(" order by no desc");

            pstmt = conn.prepareStatement(sql.toString());
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                int no = rs.getInt("no");
                String title = rs.getString("title");
                String writer = rs.getString("writer");
                String regDate = rs.getString("reg_date");

                BoardVO board = new BoardVO();
                board.setNo(no);
                board.setTitle(title);
                board.setWriter(writer);
                board.setRegDate(regDate);

                list.add(board);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCClose.close(pstmt, conn);
        }
        return list;
    }

    /**
     * 새글등록을 위한 seq_t_board_no의 시퀀스 추출
     */
    public int selectBoardNo() {
        String sql = "SELECT SEQ_T_BOARD_NO.NEXTVAL FROM DUAL";
        try (
                Connection conn = new ConnectionFactory().getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            ResultSet rs = pstmt.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }


    /**
     * 새글 등록
     */
    public void insertBoard(BoardVO board) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = new ConnectionFactory().getConnection();
            StringBuilder sql = new StringBuilder();
            sql.append("INSERT INTO t_board(no, title, writer, content)");
            sql.append("VALUES (?, ?, ?, ?) ");
            pstmt = conn.prepareStatement(sql.toString());

            int loc = 1;
            pstmt.setInt(loc++, board.getNo());
            pstmt.setString(loc++, board.getTitle());
            pstmt.setString(loc++, board.getWriter());
            pstmt.setString(loc++, board.getContent());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCClose.close(pstmt, conn);
        }
    }

    //---------------------------------------------------------------
    // 첨부파일 CRUD
    //---------------------------------------------------------------
    public void insertBoardFile(BoardFileVO fileVO) {
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO T_BOARD_FILE(NO, BOARD_NO, FILE_ORI_NAME, FILE_SAVE_NAME, FILE_SIZE) ");
        sql.append("VALUES (SEQ_T_BOARD_FILE_NO.NEXTVAL, ?, ?, ?, ?) ");

        try (
                Connection conn = new ConnectionFactory().getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setInt(1, fileVO.getBoardNo());
            pstmt.setString(2, fileVO.getFileOriName());
            pstmt.setString(3, fileVO.getFileSaveName());
            pstmt.setInt(4, fileVO.getFileSize());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<BoardFileVO> selectFileByNo(int boardNo) {
        List<BoardFileVO> fileList = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT NO, FILE_ORI_NAME, FILE_SAVE_NAME, FILE_SIZE ");
        sql.append("  FROM T_BOARD_FILE ");
        sql.append(" WHERE BOARD_NO = ? ");

        try (
                Connection conn = new ConnectionFactory().getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setInt(1, boardNo);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardFileVO fileVO = new BoardFileVO();
                fileVO.setNo(rs.getInt("NO"));
                fileVO.setFileOriName(rs.getString("FILE_ORI_NAME"));
                fileVO.setFileSaveName(rs.getString("FILE_SAVE_NAME"));
                fileVO.setFileSize(rs.getInt("FILE_SIZE"));

                fileList.add(fileVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileList;
    }
}