package kr.ac.kopo.member.dao;

import util.ConnectionFactory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
    public List<MemberVO> selectAll() {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT ID, NAME, EMAIL_ID, EMAIL_DOMAIN, TYPE, TO_CHAR(REG_DATE, 'YYYY/MM/DD') AS REG_DATE ");
        sql.append("  FROM T_MEMBER ");
        try (
                Connection conn = new ConnectionFactory().getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            ResultSet rs = pstmt.executeQuery();
            List<MemberVO> memberList = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("ID");
                String name = rs.getString("NAME");
                String emailId = rs.getString("EMAIL_ID");
                String emailDomain = rs.getString("EMAIL_DOMAIN");
                String type = rs.getString("TYPE");
                String regDate = rs.getString("REG_DATE");
                MemberVO member = new MemberVO(id, name, emailId, emailDomain, type, regDate);
                memberList.add(member);
            }
            return memberList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public MemberVO memberDetailInfo(String id) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT *  ");
        sql.append("  FROM T_MEMBER  ");
        sql.append(" WHERE ID = ?");
        try (
                Connection conn = new ConnectionFactory().getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String memberId = rs.getString("ID");
                String name = rs.getString("NAME");
                String password = rs.getString("PASSWORD");
                String email_id = rs.getString("EMAIL_ID");
                String email_domain = rs.getString("EMAIL_DOMAIN");
                String tel1 = rs.getString("TEL1");
                String tel2 = rs.getString("TEL2");
                String tel3 = rs.getString("TEL3");
                String post = rs.getString("POST");
                String basic_addr = rs.getString("BASIC_ADDR");
                String detail_addr = rs.getString("DETAIL_ADDR");
                String type = rs.getString("TYPE");
                String reg_date = rs.getString("REG_DATE");
                MemberVO member = new MemberVO(memberId, name, password, email_id, email_domain, tel1, tel2, tel3, post, basic_addr, detail_addr, type, reg_date);
                return member;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void memberInsert(MemberVO member) {
        StringBuilder sql = new StringBuilder();
        sql.append("INSERT INTO T_MEMBER(ID, NAME, PASSWORD, EMAIL_ID, EMAIL_DOMAIN, TEL1, TEL2, TEL3, POST, BASIC_ADDR, DETAIL_ADDR) ");
        sql.append("VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ");

        try (Connection conn = new ConnectionFactory().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getName());
            pstmt.setString(3, member.getPassword());
            pstmt.setString(4, member.getEmail_id());
            pstmt.setString(5, member.getEmail_domain());
            pstmt.setString(6, member.getTel1());
            pstmt.setString(7, member.getTel2());
            pstmt.setString(8, member.getTel3());
            pstmt.setString(9, member.getPost());
            pstmt.setString(10, member.getBasic_addr());
            pstmt.setString(11, member.getDetail_addr());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public MemberVO login(MemberVO member) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT ID, PASSWORD, NAME, TYPE ");
        sql.append("  FROM T_MEMBER ");
        sql.append(" WHERE ID = ? AND PASSWORD = ? ");
        try (
                Connection conn = new ConnectionFactory().getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql.toString());
        ) {
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            ResultSet rs = pstmt.executeQuery();

            rs.next();
            MemberVO memberVO = new MemberVO();
            memberVO.setId(rs.getString("ID"));
            memberVO.setPassword(rs.getString("PASSWORD"));
            memberVO.setName(rs.getString("NAME"));
            memberVO.setType(rs.getString("TYPE"));
            return memberVO;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
