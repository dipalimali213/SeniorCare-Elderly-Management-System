package com.seniorcitizen.webpro;

public class GetSet {
    private static int seniorId;
    private static int caretakerId;

    public static int getSeniorId() {
        return seniorId;
    }

    public static void setSeniorId(int id) {
        seniorId = id;
    }

    public static int getCaretakerId() {
        return caretakerId;
    }

    public static void setCaretakerId(int id) {
        caretakerId = id;
    }
}
