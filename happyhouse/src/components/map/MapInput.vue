<template>
  <div id="search-box" class="card">
    <div>
      <form class="form-inline" id="frm" action="search.html">
        <div class="form-group md">
          <select class="form-control" name="sido" id="sido">
            <option value="all">시도</option>
          </select>
        </div>
        <div class="form-group md-1">
          <select class="form-control" name="gugun" id="gugun">
            <option value="all">구군</option>
          </select>
        </div>
        <div class="form-group md-1">
          <select class="form-control" name="dong" id="dong">
            <option value="all">읍면동</option>
          </select>
        </div>
      </form>
    </div>
    <div class="btn-group">
      <button id="apt-deal" type="button" class="btn btn-primary" state="on">
        아파트 매매
      </button>
      <button id="apt-rent" type="button" class="btn btn-primary" state="on">
        아파트 전월세
      </button>
      <button id="house-deal" type="button" class="btn btn-primary" state="on">
        주택 매매
      </button>
      <button id="house-rent" type="button" class="btn btn-primary" state="on">
        주택 전월세
      </button>
    </div>

    <div class="row none-margin d-flex" style="padding: 5px">
      <div class="none-margin none-padding flex-grow-1">
        <input
          id="search-input"
          type="text"
          class="form-control form-control"
          placeholder="아파트 혹은 주택명을 입력하세요"
        />
      </div>
      <div>
        <button id="search-apt" type="button" class="btn btn-light">
          검색
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
#search-box {
  z-index: 1000;
  width: 360px;
  height: 300px;
  position: absolute;
  margin: 10px;
  background: red;
}
</style>
