package com.lh.bean;

import java.util.ArrayList;
import java.util.List;

public class AdvertisementExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AdvertisementExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleIsNull() {
            addCriterion("advertisement_role is null");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleIsNotNull() {
            addCriterion("advertisement_role is not null");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleEqualTo(Integer value) {
            addCriterion("advertisement_role =", value, "advertisementRole");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleNotEqualTo(Integer value) {
            addCriterion("advertisement_role <>", value, "advertisementRole");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleGreaterThan(Integer value) {
            addCriterion("advertisement_role >", value, "advertisementRole");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleGreaterThanOrEqualTo(Integer value) {
            addCriterion("advertisement_role >=", value, "advertisementRole");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleLessThan(Integer value) {
            addCriterion("advertisement_role <", value, "advertisementRole");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleLessThanOrEqualTo(Integer value) {
            addCriterion("advertisement_role <=", value, "advertisementRole");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleIn(List<Integer> values) {
            addCriterion("advertisement_role in", values, "advertisementRole");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleNotIn(List<Integer> values) {
            addCriterion("advertisement_role not in", values, "advertisementRole");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleBetween(Integer value1, Integer value2) {
            addCriterion("advertisement_role between", value1, value2, "advertisementRole");
            return (Criteria) this;
        }

        public Criteria andAdvertisementRoleNotBetween(Integer value1, Integer value2) {
            addCriterion("advertisement_role not between", value1, value2, "advertisementRole");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathIsNull() {
            addCriterion("advertisement_path is null");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathIsNotNull() {
            addCriterion("advertisement_path is not null");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathEqualTo(String value) {
            addCriterion("advertisement_path =", value, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathNotEqualTo(String value) {
            addCriterion("advertisement_path <>", value, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathGreaterThan(String value) {
            addCriterion("advertisement_path >", value, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathGreaterThanOrEqualTo(String value) {
            addCriterion("advertisement_path >=", value, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathLessThan(String value) {
            addCriterion("advertisement_path <", value, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathLessThanOrEqualTo(String value) {
            addCriterion("advertisement_path <=", value, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathLike(String value) {
            addCriterion("advertisement_path like", value, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathNotLike(String value) {
            addCriterion("advertisement_path not like", value, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathIn(List<String> values) {
            addCriterion("advertisement_path in", values, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathNotIn(List<String> values) {
            addCriterion("advertisement_path not in", values, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathBetween(String value1, String value2) {
            addCriterion("advertisement_path between", value1, value2, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andAdvertisementPathNotBetween(String value1, String value2) {
            addCriterion("advertisement_path not between", value1, value2, "advertisementPath");
            return (Criteria) this;
        }

        public Criteria andMenuStatusIsNull() {
            addCriterion("menu_status is null");
            return (Criteria) this;
        }

        public Criteria andMenuStatusIsNotNull() {
            addCriterion("menu_status is not null");
            return (Criteria) this;
        }

        public Criteria andMenuStatusEqualTo(Integer value) {
            addCriterion("menu_status =", value, "menuStatus");
            return (Criteria) this;
        }

        public Criteria andMenuStatusNotEqualTo(Integer value) {
            addCriterion("menu_status <>", value, "menuStatus");
            return (Criteria) this;
        }

        public Criteria andMenuStatusGreaterThan(Integer value) {
            addCriterion("menu_status >", value, "menuStatus");
            return (Criteria) this;
        }

        public Criteria andMenuStatusGreaterThanOrEqualTo(Integer value) {
            addCriterion("menu_status >=", value, "menuStatus");
            return (Criteria) this;
        }

        public Criteria andMenuStatusLessThan(Integer value) {
            addCriterion("menu_status <", value, "menuStatus");
            return (Criteria) this;
        }

        public Criteria andMenuStatusLessThanOrEqualTo(Integer value) {
            addCriterion("menu_status <=", value, "menuStatus");
            return (Criteria) this;
        }

        public Criteria andMenuStatusIn(List<Integer> values) {
            addCriterion("menu_status in", values, "menuStatus");
            return (Criteria) this;
        }

        public Criteria andMenuStatusNotIn(List<Integer> values) {
            addCriterion("menu_status not in", values, "menuStatus");
            return (Criteria) this;
        }

        public Criteria andMenuStatusBetween(Integer value1, Integer value2) {
            addCriterion("menu_status between", value1, value2, "menuStatus");
            return (Criteria) this;
        }

        public Criteria andMenuStatusNotBetween(Integer value1, Integer value2) {
            addCriterion("menu_status not between", value1, value2, "menuStatus");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}