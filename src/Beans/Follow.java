package Beans;

/**
 * Created by duchenguang on 2017/1/12.
 */
public class Follow {
    private String ID,Content,CreateTime,FollowTo,Maker,MakerLookNumber,MakerPostNumber,MakerFollowNumber,MakerImg;

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

    public String getCreateTime() {
        return CreateTime;
    }

    public void setCreateTime(String createTime) {
        CreateTime = createTime;
    }

    public String getFollowTo() {
        return FollowTo;
    }

    public void setFollowTo(String followTo) {
        FollowTo = followTo;
    }

    public String getMaker() {
        return Maker;
    }

    public void setMaker(String maker) {
        Maker = maker;
    }

    public String getMakerLookNumber() {
        return MakerLookNumber;
    }

    public void setMakerLookNumber(String makerLookNumber) {
        MakerLookNumber = makerLookNumber;
    }

    public String getMakerPostNumber() {
        return MakerPostNumber;
    }

    public void setMakerPostNumber(String makerPostNumber) {
        MakerPostNumber = makerPostNumber;
    }

    public String getMakerFollowNumber() {
        return MakerFollowNumber;
    }

    public void setMakerFollowNumber(String makerFollowNumber) {
        MakerFollowNumber = makerFollowNumber;
    }

    public String getMakerImg() {
        return MakerImg;
    }

    public void setMakerImg(String makerImg) {
        MakerImg = makerImg;
    }
}
