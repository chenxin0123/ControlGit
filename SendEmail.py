import sys
import smtplib
from email.mime.text import MIMEText
from email.header import Header
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication

sender = '407008175@qq.com'
receiver = '407008175@qq.com'
smtpserver = 'smtp.qq.com'

username = sender
password = sys.argv[3]

def send_mail(title, path):
    try:
        if not isinstance(title,unicode):
            title = unicode(title, 'utf-8')

        msg = MIMEMultipart()
        msg['Subject'] = title
        msg['From'] = sender
        msg['To'] = receiver
        msg["Accept-Language"]="zh-CN"
        msg["Accept-Charset"]="ISO-8859-1,utf-8"

        imagepart = MIMEApplication(open(path, 'rb').read())
        imagepart.add_header('Content-Disposition', 'attachment', filename='QRCode.png')
        msg.attach(imagepart)

        smtp = smtplib.SMTP_SSL(smtpserver,465)
        smtp.login(username, password)
        smtp.sendmail(sender, receiver, msg.as_string())
        smtp.quit()
        return True
    except Exception, e:
        print str(e)
        return False

print sys.argv[1], sys.argv[2], password
if send_mail(sys.argv[1], sys.argv[2]):
    print "done!"
else:
    print "failed!"
