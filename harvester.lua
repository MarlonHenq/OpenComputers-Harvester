sizeSide = 8
sizeFront = 8

leftOrRight = false -- 'false' for left 'true' for right

print("Colector Started!")

print("Start now? (y/n)")
start = io.read()


function harvest()
    print("Harvest!")

    for i=1,sizeFront do
        robot.forward()
    end

    if leftOrRight then
        robot.turnLeft()
    else
        robot.turnRight()
    end

    for i = 1,sizeFront do
        for i = 1,sizeSide - 1 do
            robot.swingDown()
            robot.placeDown()
            robot.forward()
        end

        robot.swingDown()
        robot.placeDown()

        if leftOrRight then
            robot.turnLeft()
            robot.forward()
            robot.turnLeft()

            leftOrRight = false
        else
            robot.turnRight()
            robot.forward()
            robot.turnRight()

            leftOrRight = true
        end
    end

    if leftOrRight then
        robot.turnLeft()
    else
        robot.turnRight()
    end
    robot.forward()

    for i=2,16 do
        robot.select(i)
        robot.dropDown()
    end
    robot.select(1)

    robot.turnLeft()
    robot.turnLeft()

    print("Finish!")
end

if start == "y" then
    harvest()
end

while true do
    os.sleep(2700) -- 45min

    harvest()
end
