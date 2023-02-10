package com.test.finalBoard.service;

import com.test.finalBoard.dto.MemberDTO;
import com.test.finalBoard.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemberRepository memberRepository;

    public int save(MemberDTO memberDTO) {
        return memberRepository.save(memberDTO);
    }

    public boolean login(MemberDTO memberDTO) {
        MemberDTO loginMember = memberRepository.login(memberDTO); // loginMember => db 테이블 조회 결과
        System.out.println("memberDTO = " + memberDTO);
        System.out.println("memberDTO = " + loginMember);
        if (loginMember != null) {
            return true;
        }else {
            return false;
        }
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
        // 잘못된 id 요청 들어와서 잘못 입력했다고 알려주는 기능 추가 가능
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }

    public MemberDTO findByMemberEmail(String loginEmail) {
        return memberRepository.findByMemberEmail(loginEmail);
    }

    public boolean update(MemberDTO memberDTO) {
        int result = memberRepository.update(memberDTO);
        System.out.println("result = " + result);
        if (result > 0) {
            return true;
        }else {
            return false;
        }
    }

    public String emailCheck(String memberEmail) {
        MemberDTO memberDTO = memberRepository.findByMemberEmail(memberEmail);
        if (memberDTO == null) {
            return "ok";
        }else {
            return "no";
        }
    }
}
