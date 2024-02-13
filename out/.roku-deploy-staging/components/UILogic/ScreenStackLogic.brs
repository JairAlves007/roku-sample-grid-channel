sub InitScreenStack()
  m.screenStacks = []
end sub

sub ShowScreen(node as Object)
  prev = m.screenStacks.Peek()
  ' print "jair prev "; prev

  if prev <> invalid then
    prev.visible = false
  end if

  m.top.AppendChild(node)
  node.visible = true
  node.SetFocus(true)
  m.screenStacks.Push(node)

  ' print "jair screenStacks "; prev
end sub

sub CloseScreen(node as Object)
  if node = invalid OR (m.screenStacks.Peek() <> invalid AND m.screenStacks.Peek().IsSameNode(node)) then
    last = m.screenStacks.Pop()
    ' print "jair screenStacks "; last

    last.visible = false
    m.top.RemoveChild(node)

    prev = m.screenStacks.Peek()

    if prev <> invalid then
      prev.visible = true
      prev.SetFocus(true)
    end if
  end if
end sub