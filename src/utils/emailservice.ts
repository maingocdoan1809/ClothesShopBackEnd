import * as nodemailer from "nodemailer";
import { type } from "os";

type MailInfor = {
  from: string;
  to: string;
  html: string;
  text: string;
  subject?: string;
};

async function sendMail(infor: MailInfor) {
  const transporter = nodemailer.createTransport({
    host: process.env.MAIL_HOST || "smtp.gmail.com",
    port: Number(process.env.MAIL_PORT) | 587,
    secure: Boolean(process.env.MAIL_USE_HTTPS) || false, // true for 465, false for other ports
    auth: {
      user: process.env.MAIL_USER,
      pass: process.env.MAIL_APP_PASS,
    },
  });
  return transporter.sendMail({
    from: infor.from,
    to: infor.to,
    html: infor.html,
    subject: infor.subject,
  });
}
