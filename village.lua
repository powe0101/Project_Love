function CreateVillage()
  if playerLife == 5 then
    LifeFive() --최초에 게임이 시작될때 라이프가 5개로 띄워지도록. 단, 다른 스테이지 갔다가 라이프가 5개 밑일 경우 실행되지 않도록.
  end

  --다른 스테이지 갔다 올때를 대비해서 초기화시켜줌.
  if stageLevel ~= true then
    stageLevel = 0

    p1=nil
    pl=Player.create()
    pl:ResetCoord()
  end

  chiefChar = Chief.create()
  chiefChar:reset(550,145)

  SetVilliageBackgroundMusic()
  CreateGround(-49,76)
  CreateGround(541,76)
  CreateBackGround(-40,0)
  CreateBackGround(250,0)
  CreateBackGround(540,0)
  CreateBackGround(830,0)

  CreateTree(-50,80)
  CreateTree(220,80)
  CreateTree(580,80)
  CreateTree(800,80)

  CreateCloud(-50,1)
  CreateCloud(100,1)
  CreateCloud(300,1)
  CreateCloud(500,1)
  CreateCloud(700,1)
  CreateCloud(900,1)

  CreateHouse(17,108)
  CreateChiefHouse(480,77)
  CreateBlackSmithHouse(850,108)

  CreatePortal(300,113) -- 0725 마을 집 문 앞에 만들어놓은 포탈은 세이브/로드 팝업을 띄우도록 추후에 수정해야함. by.현식
  CreateBox(180,40)
  CreateBox(200,40)
  CreateBox(200,155)

  CreateBox(220,40)
  CreateBox(220,155)
  CreateBox(240,60)
  CreateBox(240,155)

  CreateBox(280,60)
  CreateBox(300,60)
  CreateBox(320,60)
  CreateBox(340,60)
  CreateBox(340,155)
  CreateBox(360,60)
  CreateBox(360,135)
  CreateBox(380,115)
  CreateBox(400,95)

  CreateBox(440,70)
  CreateBox(460,50)
  CreateBox(460,70)
  CreateBox(480,70)
  CreateBox(500,50)
  CreateBox(540,30)

  CreateQMark(chiefChar.x, 115) --장로위에 느낌표. 
end

function SetVilliageBackgroundMusic()
  love.audio.rewind(bgMusic)
  bgMusic:setPitch(1)
  --이상 초기화 부분.
end

function DeleteVillage()
  BackGroundListDelete()
  CloudListDelete()
  TreeListDelete()
  HouseListDelete()
  ChiefHouseListDelete()
  GroundListDelete()
  BoxListDelete()
  RiverListDelete()
  QMarkListDelete()
  BridgeListDelete()
  PicketListDelete()
  CastleListDelete()

  --초기화
  if stageLevel == 3 then
    GroundFullFrameChange()
  end
  MOVE_POWER = 1

  canPass = false
  BridegePassValue = 0
  phase = 0
end
