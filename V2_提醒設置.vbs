on error resume next
input = msgbox("�x����ֹ=�_�C���ѣ���ԇ=ָ�����ڕr�g���ѣ�����=ÿ���ָ���r�g���ѣ��M���O��Ոݔ��setting",2+64,"���r������")
content = inputbox("Ոݔ��Ҫ���ѵ����","���у���")
set fso = createobject("scripting.filesystemobject")
dim paths(4)
paths(0) = fso.getfile(wscript.scriptfullname).parentfolder + "\"
paths(1) = "C:\"
paths(2) = "D:\"
paths(3) = "E:\"

err.description = False
continue = False
for each path in paths
  test = path + "test.txt"
  fso.createtextfile(test)
  if fso.fileexists(test) then
    continue = True
  end if
  if continue = True then
    fso.DeleteFile(test)
    exit for
  end if
Next
Last_filename = ""
creation_moment = Cstr(date+time)
filename = path+creation_moment +".vbs"
filename = Cstr(filename)
Last_Filename = (Replace(filename,"/","-"))
Last_Filename = (Replace(Last_Filename,":","-",4))
Last_filename = Replace(Last_Filename," ","")
Last_Filename = Cstr(Last_Filename)
fso.createtextfile("C:\" + Last_filename)
fso.createtextfile("")

set edit = fso.opentextfile(Last_Filename,8,False)
edit.writeline "set sapi = CreateObject("&chr(34)&"SAPI.SpVoice"&chr(34)&")"
edit.writeline "sapi.Speak(" &chr(34)& content &chr(34)&")"
edit.writeline "msgbox "&chr(34)&content&chr(34)&",4096+64,"&chr(34)&"����"&chr(34)&""
edit.close
set path = fso.getfile("C:\" + Last_Filename)
msgbox last_filename
path.attributes = 2

if input = 3 then '�_�C����
'ws.run"schtasks /create /sc DAILY /tn "&task& " /tr " & filename  

elseif input = 4 then 'ָ�����ڼ��r�g
'ws.run"schtasks /create /sc DAILY /tn "&task& " /tr " & filename 
input_items = inputbox("Ոݔ��ָ�������ں͕r�g(day month hour min),24С�r��,ӛ���ÿո�ָ��_")
task_time = split(input_items) ' 4���array


elseif input = 5 then 'ָ��ÿ��r�g
SetTime = inputbox("ָ��ÿ���ض��r�g����-Ոݔ��ָ����С�r����犣���ð̖�ָ� e.g. 08:00,��ʮ��С�r����Ӣ�İ��ð̖��",,":")
order = "schtasks /create /tn ParticularTimeEveryDay /tr C:\"&Last_Filename& "/sc daily /st " & SetTime
x = inputbox("x",,order)
msgbox("test")
ws.run order
end if