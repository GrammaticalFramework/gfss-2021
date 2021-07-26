abstract GFSS2021 = {

flags coding = utf8 ;

flags startcat = Phrase;

cat
   Phrase; Recipient; Fact; Object; Kind; Property;

fun
    hi_Phrase : Phrase;
    world_Recipient : Recipient;
    helloRecipientPhrase : Recipient -> Phrase;
    factPhrase : Fact -> Phrase;
    thisKind : Kind -> Object;
    restaurant_Kind : Kind;
    good_Property : Property;
    objectPropertyFact : Object -> Property -> Fact;
    car_Kind : Kind;
    hotel_Kind : Kind;
    dirty_Property : Property;
    swedish_Property : Property;
    propertyKindKind : Property -> Kind -> Kind;
    questionFactPhrase : Fact -> Phrase;
    thoseKindObject : Kind -> Object;

}
