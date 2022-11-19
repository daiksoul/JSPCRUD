package we.snappost.vo;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@ToString
public class PostVO {
    @Setter(AccessLevel.NONE)
    private int id;
    private String author;
    private String email;
    private String title;
    private String content;
    @Setter(AccessLevel.NONE)
    private Date regDate;
    @Setter(AccessLevel.NONE)
    private Date modDate;
    private String photo;
    private String category;
    private int likes;
    private String color;
    private boolean publ;
}
