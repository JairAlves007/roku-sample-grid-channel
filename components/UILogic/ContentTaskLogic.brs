sub RunContentTask()
  m.contentTask = CreateObject("roSGNode", "MainLoaderTask")
  m.contentTask.ObserveField("content", "OnMainContentLoaded")
  m.contentTask.control = "run"

  m.loadingIndicator.visible = true
end sub

sub OnMainContentLoaded()
  ' m.GridScreen.SetFocus(true)
  m.GridScreen.content = m.contentTask.content
  m.loadingIndicator.visible = false
end sub