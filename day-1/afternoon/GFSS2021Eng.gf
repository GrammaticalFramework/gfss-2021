concrete GFSS2021Eng of GFSS2021 = {

flags coding = utf8 ;

lincat
    Phrase = Str;
    Recipient = Str;
    Fact = {subj : Str ; pred : {verb : Str ; compl : Str}};
    Object = {s : Str ; n : Number};
    Kind = Number => Str;
    Property = Str;

lin
    hi_Phrase  = "hi";
    world_Recipient  = "world";
    helloRecipientPhrase recipient = "hello" ++ recipient;
    factPhrase fact = fact.subj ++ fact.pred.verb ++ fact.pred.compl;
    thisKind kind = {s = "this" ++ kind ! Sg ; n = Sg};
    restaurant_Kind  = regKind "restaurant";
    good_Property  = "good";
    objectPropertyFact object property = {subj = object.s ; pred = {verb = be_Verb ! object.n ; compl = property}};
    car_Kind  = table {Sg => "car" ; Pl => "cars"};
    hotel_Kind  = regKind "hotel";
    dirty_Property  = "dirty";
    swedish_Property  = "Swedish";
    propertyKindKind property kind = table {n => property ++ kind ! n};
    questionFactPhrase fact = fact.pred.verb ++ fact.subj ++ fact.pred.compl;
    thoseKindObject kind = {s = "those" ++ kind ! Pl ; n = Pl};

param
    Number = Sg | Pl;

oper
    regKind : Str -> Number => Str = \s -> table {Sg => s ; Pl => s + "s"};
    be_Verb : Number => Str = table {Sg => "is" ; Pl => "are"};

}
