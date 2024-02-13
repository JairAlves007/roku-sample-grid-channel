sub Init()
  m.rowList = m.top.FindNode("rowList")
  m.titleLabel = m.top.FindNode("titleLabel")
  m.descriptionLabel = m.top.FindNode("descriptionLabel")
  m.rowList.SetFocus(true)

  m.rowList.ObserveField("rowItemFocused", "OnItemFocused")
end sub

sub OnItemFocused()
  focusedIndex = m.rowList.rowItemFocused
  row = m.rowList.content.GetChild(focusedIndex[0])
  item = row.GetChild(focusedIndex[1])

  if item <> invalid
    m.titleLabel.text = item.title
    m.descriptionLabel.text = item.description

    if item.length <> invalid
      m.titleLabel.text += " | " + GetTime(item.length)
    end if
  end if

  ' print "jair focusedIndex "; focusedIndex
  ' print "jair m.rowList.content "; m.rowList.content
  ' print "jair row "; row
  ' print "jair item "; item
end sub

function GetTime(length as Integer) as String
  minutes = Fix(length / 60)
  seconds = length MOD 60

  if minutes < 10
    minutes = "0" + minutes.ToStr()
  else
    minutes = minutes.ToStr()
  end if

  if seconds < 10
    seconds = "0" + seconds.ToStr()
  else
    seconds = seconds.ToStr()
  end if

  return minutes + ":" + seconds
end function