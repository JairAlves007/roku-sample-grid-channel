sub OnContentSet()
  content = m.top.itemContent

  if content <> invalid
    m.top.FindNode("poster").uri = content.hdPosterURL
  end if
end sub