import sendgrid
import os
from sendgrid.helpers.mail import *
import csv

sg = sendgrid.SendGridAPIClient(apikey='SG.<>.hNu6A4UZHMkMHwsDS0WXQriQLZLgMp4JS2X0xk75Lrc')
from_email = Email("<>")

with open('list.txt') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        print(row[0])
        to_email = Email(row[0])
        subject = "<>"
        content = Content("text/plain", "<>")
        mail = Mail(from_email, subject, to_email, content)
        response = sg.client.mail.send.post(request_body=mail.get())
        print(response.status_code)
