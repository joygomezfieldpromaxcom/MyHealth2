using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MyHealthWebAPI.Data;
using MyHealthWebAPI.Models;

namespace MyHealthWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProblemListsController : ControllerBase
    {
        private readonly MyHealthContext _context;

        public ProblemListsController(MyHealthContext context)
        {
            _context = context;
        }

        // GET: api/ProblemLists
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProblemList>>> GetProblemListItems()

        {
            return await _context.ProblemListItems.ToListAsync();
        }

        // GET: api/ProblemLists/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ProblemList>> GetProblemList(string id)
        {
            var problemList = await _context.ProblemListItems.FindAsync(id);

            if (problemList == null)
            {
                return NotFound();
            }

            return problemList;
        }

        // PUT: api/ProblemLists/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProblemList(string id, ProblemList problemList)
        {
            if (id != problemList.ProblemListName)
            {
                return BadRequest();
            }

            _context.Entry(problemList).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProblemListExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/ProblemLists
        [HttpPost]
        public async Task<ActionResult<ProblemList>> PostProblemList(ProblemList problemList)
        {
            _context.ProblemListItems.Add(problemList);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetProblemList", new { id = problemList.ProblemListName }, problemList);
        }

        // DELETE: api/ProblemLists/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<ProblemList>> DeleteProblemList(string id)
        {
            var problemList = await _context.ProblemListItems.FindAsync(id);
            if (problemList == null)
            {
                return NotFound();
            }

            _context.ProblemListItems.Remove(problemList);
            await _context.SaveChangesAsync();

            return problemList;
        }

        private bool ProblemListExists(string id)
        {
            return _context.ProblemListItems.Any(e => e.ProblemListName == id);
        }
    }
}
