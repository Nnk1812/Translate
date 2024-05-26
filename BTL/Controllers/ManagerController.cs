﻿using BTL.DTO;
using BTL.Models;
using Microsoft.AspNetCore.Mvc;
using X.PagedList;

namespace BTL.Controllers
{
    public class ManagerController : Controller
    {
        private readonly ILogger<ManagerController> _logger;
        private DictionaryContext _dBDic { get; set; }
        public ManagerController(ILogger<ManagerController> logger, DictionaryContext dictionaryContext)
        {
            _logger = logger;
            this._dBDic = dictionaryContext;
        }
        //------------------------MANAGER/WORD---------------------------
        [HttpGet]
        [Route("/manager/word")]
        public IActionResult Index(int page = 1)
        {
            int pageSize = 10;
            int pageNumber = page;
            PagedList<TblWord> word = new PagedList<TblWord>(this._dBDic.getallword().ToList(), pageNumber, pageSize);
            return View("Index", word);
        }
        [HttpPost]
        [Route("/manager/word")]
        public IActionResult getwordbyWord(string Word, int page = 1)
        {
            int pageSize = 10;
            int pageNumber = page;
            PagedList<TblWord> word = new(this._dBDic.searchword(Word).ToList(), pageNumber, pageSize);
            return View("Index", word);
        }
        [HttpPost]
        [Route("/manager/word/edit")]
        public IActionResult editword([FromBody] TblWord data)
        {
            this._dBDic.editword(data.Id, data.IdLanguage, data.IdLanguageTrans, data.IdWordtype, data.IdUser, data.SWord, data.SExample, data.SDefinition, data.sWordTrans);
            return Json(data);
        }
        [HttpGet]
        [Route("manager/searchWord")]
        public List<WordSearch> searchWords(int Id_Language, int Id_Language_trans, string sWord)
        {
            List<WordSearch> w = this._dBDic.searchWord(Id_Language, Id_Language_trans, sWord).ToList();
            return w;
        }
        [HttpDelete]
        [Route("/manager/word/delete")]
        public IActionResult DeleteWord([FromBody] TblWord data)
        {
            this._dBDic.deleteWord(data.Id);
            return Json(data);
        }
        //--------------------------MANAGER/USER----------------------------

        [HttpGet]
		[Route("/manager/user")]
        public IActionResult ManagerUser(int page = 1)
        {
            int pageSize = 10;
            int pageNumber = page;
            PagedList<TblUser> users = new PagedList<TblUser>(this._dBDic.getAllUser().ToList(), pageNumber, pageSize);
            return View("managerUser", users);
        }




        [HttpPost]
        [Route("/manager/user/upgrade")]
        public IActionResult UpGradeUserRole([FromBody] TblUser data)
        {
            this._dBDic.UpgradeRoleUser(data.Id, data.SRole);
            return Json(data);
        }


        [HttpDelete]
        [Route("/manager/user/delete")]
        public IActionResult deleteUser([FromBody] TblUser data)
        {
            this._dBDic.deleteUser(data.Id);
            return Json(data);
        }

        [HttpGet]
        [Route("/manager/user/filterUser")]
        public IActionResult filterUser(string email="", string role="", int page = 1)
        {
            Console.WriteLine("áda "+email + role);
            int pageSize = 10;
            int pageNumber = page;
            PagedList<TblUser> userFilter = new PagedList<TblUser>(this._dBDic.filterUser(email, role).ToList(), pageNumber, pageSize);
            return View("managerUser", userFilter);
        }


        [HttpGet]
        [Route("/manager/user/getListPageAjax")]
        public ActionResult getListPageAjax(int page=1, int pageSize=1)
        {
            List<TblUser> users = this._dBDic.getAllUser().ToList(); ;

            var pageIndex = page;
            var totalPage= users.Count;
            var numberPage = Math.Ceiling((float)(totalPage / pageSize));
            var start = (pageIndex - 1) * pageSize;
            var users1 = users.Skip(start).Take(pageSize);

            return Json(new
            {
                data = users1,
                totalItem = users.Count,
                page,
                pageSize
            });
        }
    }
}
