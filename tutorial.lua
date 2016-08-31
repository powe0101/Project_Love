tutorialStart = false
tutorialProgressLevel = 1 --1은 기본. 2는 용사집. 3은 대장간. 4는 다시 장로와 대화.

talkCountWithElder = 1
talkCountAtHome = 1
talkCountAtPortal = 1

tutorialTalkList = {}

-- ※ 튜토리얼 활성화 하기 전에는 포탈 못타게 막아놓을 것.

function ControlTutorial()
	--마을에서 동작하는 튜토리얼
	if stageLevel == 0 then
		if tutorialProgressLevel == 1 and 275 < pl:GetX() and pl:GetX() < 285 then
			if love.keyboard.isDown('up') then --엔터키도 넣으면 좋은데 or love.keyboard.isDown('return') then
				tutorialStart = true
			end
		end

	if tutorialStart then --튜토리얼이 동작할때 사용되는 것들.
		if love.keyboard.isDown('return') then
			if tutorialProgressLevel == 1 then
				talkCountWithElder = talkCountWithElder + 1
			elseif tutorialProgressLevel == 2 then
				if talkCountAtHome == 1 then
					talkCountAtHome = talkCountAtHome + 1
				else
					tutorialStart = false
					tutorialProgressLevel = tutorialProgressLevel + 1
				end
			elseif tutorialProgressLevel == 3 then
				if talkCountAtPortal == 1 or talkCountAtPortal == 2 then
					talkCountAtPortal = talkCountAtPortal + 1
				else
					tutorialStart = false
					tutorialProgressLevel = tutorialProgressLevel + 1
				end
			end
		end
		if love.keyboard.isDown('escape') then
			--esc누르면 튜토리얼 취소.
			tutorialStart = false
			talkCountWithElder = 1
		end
	end

	end --if stageLevel == 0
end

function StartTutorial()
	love.graphics.setColor(0,0,0,255)
	if talkCountWithElder == 1 then
		--맨 처음에만 리스트에 추가할 수 있도록.
		tutorialTalkList = {WarriorTalk1, ElderTalk1, WarriorTalk2, ElderTalk2, 
		WarriorTalk3, ElderTalk3, WarriorTalk4, ElderTalk4,WarriorTalk5, ElderTalk5}
	end

	if talkCountWithElder < 11 and tutorialProgressLevel == 1 then --장로
		if talkCountWithElder % 2 == 0 then--짝수, 즉 마왕이 말할 때
		 	ElderTalkBackground()
		else --용사가 말할 때
		 	WarriorTalkBackgroundAtVillage()
		end
		tutorialTalkList[talkCountWithElder]()
	elseif tutorialProgressLevel == 2 then -- 용사집
		ElderTalkBackground()
		if talkCountAtHome == 1 then
			ElderTalkAtHome1()
		else 
			ElderTalkAtHome2()
		end
	elseif tutorialProgressLevel == 3 then --포탈
		ElderTalkBackground() 
		if talkCountAtPortal == 1 then
			ElderTalkAtProtal1()
		elseif talkCountAtPortal == 2 then
			ElderTalkAtProtal2()
		else
			ElderTalkAtProtal3()
		end
	elseif tutorialProgressLevel == 4 then --대장장이
		--대장장이와의 대화 부분. 배경 다시 그려야할듯.
	else --대화가 끝난 후.
		tutorialStart = false
		tutorialProgressLevel = tutorialProgressLevel + 1
		qmarkCheckAtVillage = true
	end
	
	love.graphics.setColor(255,255,255,255)
end

function CheckTutorial()
	if stageLevel == 0 and pl:GetX() == 60 and tutorialProgressLevel == 2 then --일정 좌표 넘어가서 대화 이벤트 발생.
		tutorialStart = true
	elseif stageLevel == 0 and pl:GetX() == 180 and tutorialProgressLevel == 3 then
		tutorialStart = true
	elseif stageLevel == 0 and pl:GetX() == 440 and tutorialProgressLevel == 4 then
		tutorialStart = true
	end
end

----------------------이하 대화내용

function ElderTalkAtHome1()
 	love.graphics.print("너의 집에서는 종이를 이용", 365, 32)
 	love.graphics.print("하여 지금까지 했던 모험에", 365, 52)
 	love.graphics.print("대한 기록이 가능하단다!", 365, 72)
end

function ElderTalkAtHome2()
	love.graphics.print("기록하는 것 이외에도 다른", 365, 32)
 	love.graphics.print("중요한 요소들도 설명해주", 365, 52)
 	love.graphics.print("마!", 365, 72)
 	love.graphics.print("자, 이번에는 바로 앞에 있는", 365, 102)
 	love.graphics.print("포탈로 이동해보거라!", 365, 122)
end

function ElderTalkAtProtal1()
 	love.graphics.print("이것은 보스가 있는 ", 365, 32)
 	love.graphics.print("각 스테이지로 이동할 ", 365, 52)
 	love.graphics.print("수 있는 중요한 포탈이란다!", 365, 72)
 	love.graphics.print("'↑'키를 눌러서 이동할 수", 365, 102)
 	love.graphics.print("있지!", 365, 122)
end

function ElderTalkAtProtal2()
 	love.graphics.print("그럼 이정도면..", 365, 32)
 	love.graphics.print("아! 그리고 중요한 말을", 365, 62)
 	love.graphics.print("빼먹을뻔 했구나!", 365, 82)
end

function ElderTalkAtProtal3()
 	love.graphics.print("마왕을 무찌르는데 필요한", 365, 32)
 	love.graphics.print("물건을 대장장이에게 맡겨", 365, 52)
 	love.graphics.print("놨으니 빨간 지붕의", 365, 72)
 	love.graphics.print("대장간으로 가서", 365, 92)
 	love.graphics.print("물건을 받아오거라!", 365, 112)
end

function WarriorTalk1()
 	love.graphics.print("장로님!", 115, 32)
 	love.graphics.print("안녕하세요?", 115, 52)
 	--love.graphics.print("Warrior Part1.", 115, 72)
end

function ElderTalk1()
 	love.graphics.print("오, 알! 어서오거라", 365, 32)
 	love.graphics.print("잘 지내고 있느냐?", 365, 52)
 	--love.graphics.print("Elder Talk 1", 365, 72)
end

function WarriorTalk2()
 	love.graphics.print("네. 장로님 덕분에요!", 115, 32)
end

function ElderTalk2()
 	love.graphics.print("그래. 마침 잘왔구나", 365, 32)
 	love.graphics.print("너에게 할말이 있단다", 365, 52)
end

function WarriorTalk3()
 	love.graphics.print("뭔데요??", 115, 32)
 	--love.graphics.print("Warrior Part1.", 115, 52)
 	--love.graphics.print("Warrior Part1.", 115, 72)
end

function ElderTalk3()
 	love.graphics.print("음.. 지난번에 내가 줬던 ", 365, 32)
 	love.graphics.print("종이를 기억하니??", 365, 52)
 	--love.graphics.print("Elder Talk 1", 365, 72)
end

function WarriorTalk4()
 	love.graphics.print("네?? 음...", 115, 32)
 	love.graphics.print("글쎄요..", 115, 52)
 	love.graphics.print("잘 기억이 나지 않아요.", 115, 72)
end

function ElderTalk4()
 	love.graphics.print("뭐라고!? ", 365, 32)
 	love.graphics.print("그 종이는 굉장히 중요한", 365, 52)
 	love.graphics.print("종이란다!!", 365, 72)
end

function WarriorTalk5()
 	love.graphics.print("무슨 종이인데요 ??", 115, 32)
 	--love.graphics.print("Warrior Part1.", 115, 52)
 	--love.graphics.print("Warrior Part1.", 115, 72)
end

function ElderTalk5()
	love.graphics.print("그 종이는 니가 앞으로", 365, 32)
	love.graphics.print("헤쳐나갈 모험을 기록할 수", 365, 52)
	love.graphics.print("있는 물건이란다!", 365, 72)

 	love.graphics.print("자! 파란지붕인 너의 집으로", 365, 92)
 	love.graphics.print("가서 찾아보거라", 365, 112)
 	--love.graphics.print("Elder Talk 1", 365, 72)
end

function ElderTalkBackground()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	DrawRectangle(180, 15, 80, 60)
	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("fill", 362, 32, 156, 116) 
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
end

function WarriorTalkBackgroundAtVillage()
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA
	DrawRectangle(55, 15, 80, 60)
  	love.graphics.setColor(255,255,255,255)
	love.graphics.rectangle("fill", 112, 32, 156, 116)
	love.graphics.setColor(0,0,0,255) -- 검은색 RGBA	
end