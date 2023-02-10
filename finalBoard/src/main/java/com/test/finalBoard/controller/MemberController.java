package com.test.finalBoard.controller;

import com.test.finalBoard.dto.MemberDTO;
import com.test.finalBoard.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;

// lombok 어노테이션
@Controller
@RequestMapping("/member") //member -> 공통 주소
@RequiredArgsConstructor // 의존성 주입, 생성자 주입 !@#!@#!@# 다시보기 중요!@#!@#!@#
public class MemberController {
    private final MemberService memberService;

    // 회원가입 페이지 이동
    //@GetMapping("/member/save")
    @GetMapping("/save") // member 다음의 개별 주소
    public String saveForm() {
        return "save";
    }

    // 회원가입 처리
    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO) {
        int saveResult = memberService.save(memberDTO);
        System.out.println("saveResult = " + saveResult);
        if (saveResult > 0) {
            return "login";
        }else {
          return "save";
        }
    }

    // 홈 화면에서 로그인 페이지로 이동
    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }

    // 로그인 처리
    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO,
                        HttpSession session) {
        boolean loginResult = memberService.login(memberDTO);
        if (loginResult) {
            session.setAttribute("loginEmail", memberDTO.getMemberEmail());
            return "main";
        }else {
            return "login";
        }
    }

    //회원 목록 페이지
    @GetMapping("/")
    public String findAll(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        System.out.println("memberDTOList = " + memberDTOList);
        model.addAttribute("memberList", memberDTOList);
        return "list";
    }

    // 내 정보 보기
    // query string = '/member?id=1'
    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model) {
        MemberDTO memberDTO = memberService.findById(id);
        model.addAttribute("member", memberDTO);
        return "detail";
    }

    // 회원 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        memberService.delete(id);
        return "redirect:/member/";

    }

    // 정보 수정 페이지 이동
    @GetMapping("/update")
    public String update(HttpSession session, Model model) {
        // 세션에 저장된 회원 이메일 가져오기
        String loginEmail = (String) session.getAttribute("loginEmail");
        // 가져온 이메일로 DB에서 찾은 회원 정보를 model 객체에 넣어서 update 페이지에 보내기
        MemberDTO memberDTO = memberService.findByMemberEmail(loginEmail);
        model.addAttribute("member", memberDTO);
        return "update";
    }

    // 정보 수정 처리
    @PostMapping("/update")
    public String update(@ModelAttribute MemberDTO memberDTO) {
        boolean result = memberService.update(memberDTO);
        if (result) {
            return "redirect:/member?id=" + memberDTO.getId();
        }else {
            return "index";
        }
    }

    // 회원가입 중 이메일 중복 체크
    @PostMapping("/email-check")
    public @ResponseBody String emailCheck(@RequestParam("memberEmail") String memberEmail) {
        System.out.println("memberEmail = " + memberEmail);
        String checkResult = memberService.emailCheck(memberEmail);
        return checkResult;
    }

}
