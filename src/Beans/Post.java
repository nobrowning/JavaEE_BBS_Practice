package Beans;

import java.awt.*;

/**
 * Created by duchenguang on 2017/1/11.
 */
public class Post {
    String Title,Maker,LastUSer,LastTime,CreateTime,ID,Content,MakerImg,AID;
    int LookNumber,ReplyNumber;

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getMaker() {
        return Maker;
    }

    public void setMaker(String maker) {
        Maker = maker;
    }

    public String getLastUSer() {
        return LastUSer;
    }

    public void setLastUSer(String lastUSer) {
        LastUSer = lastUSer;
    }

    public String getLastTime() {
        return LastTime;
    }

    public void setLastTime(String lastTime) {
        LastTime = lastTime;
    }

    public String getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(String createTime) {
        CreateTime = createTime;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public int getLookNumber() {
        return LookNumber;
    }

    public void setLookNumber(int lookNumber) {
        LookNumber = lookNumber;
    }

    public int getReplyNumber() {
        return ReplyNumber;
    }

    public void setReplyNumber(int replyNumber) {
        ReplyNumber = replyNumber;
    }

    public String getMakerImg() {
        return MakerImg;
    }

    public void setMakerImg(String makerImg) {
        MakerImg = makerImg;
    }

    public String getAID() {
        return AID;
    }

    public void setAID(String AID) {
        this.AID = AID;
    }
}
