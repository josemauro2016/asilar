package asilar.controller;

import asilar.model.ServiceLocator;
import asilar.model.criteria.ProdutoCriteria;
import asilar.model.entity.Produto;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProdutoController {

    @RequestMapping(value = "/estoque/produto/novo", method = RequestMethod.GET)
    public ModelAndView create() {
        ModelAndView mv = new ModelAndView("/estoque/produto/form");
        return mv;

    }

    @RequestMapping(value = "/estoque/produto/novo", method = RequestMethod.POST)
    public ModelAndView create(WebRequest request) throws Exception {

        Produto entity = new Produto();

        entity.setNome(request.getParameter("nome"));
        entity.setQuantidadeMaxima(Long.parseLong(request.getParameter("quantidadeMaxima")));
        entity.setQuantidadeMinima(Long.parseLong(request.getParameter("quantidadeMinima")));
        entity.setUnidadeMedida(request.getParameter("unidadeMedida"));

        ServiceLocator.getProdutoService().create(entity);
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;

    }
    
    

    @RequestMapping(value = "/estoque/produto/{id}/alterar", method = RequestMethod.GET)
    public ModelAndView update(@PathVariable Long id) {
        Produto produto = new Produto();

        try {
            produto = ServiceLocator.getProdutoService().readyById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        ModelAndView mv = new ModelAndView("/estoque/produto/form");
        mv.addObject("produto", produto);
        String ativo = "produto";
        mv.addObject("ativo", ativo);
        return mv;
    }
     @RequestMapping(value = "/estoque/produto/{id}/info", method = RequestMethod.GET)
    public ModelAndView readById(@PathVariable Long id) {
        Produto produto = new Produto();
        try {
            produto = ServiceLocator.getProdutoService().readyById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        ModelAndView mv = new ModelAndView("/estoque/produto/info");
        mv.addObject("produto", produto);
        String ativo = "produto";
        mv.addObject("ativo", ativo);
        String tab = "info";
        mv.addObject("tab", tab);
        return mv;
    }

    @RequestMapping(value = "/estoque/produto/{id}/alterar", method = RequestMethod.POST)
    public ModelAndView update(WebRequest request) {
        Produto produto = new Produto();

        produto.setId(Long.parseLong(request.getParameter("id")));
        produto.setNome(request.getParameter("nome"));
        produto.setQuantidadeMaxima(Long.parseLong(request.getParameter("quantidadeMaxima")));
        produto.setQuantidadeMinima(Long.parseLong(request.getParameter("quantidadeMinima")));
        produto.setUnidadeMedida(request.getParameter("unidadeMedida"));

        ModelAndView mv = null;
        try {
            /*Map<String, Object> fields = new HashMap<>();
            fields.put("produto", produto);
            fields.put("id", produto.getId());
            fields.put("nome", produto.getNome());
            fields.put("quantidadeMaxima", produto.getQuantidadeMaxima());
            fields.put("quantidadeMinima", produto.getQuantidadeMinima());
            fields.put("unidadeMedia", produto.getUnidadeMedida());

            Map<String, String> errors = ServiceLocator.getProdutoService().validateForUpdate(fields);*/
            //if (errors.isEmpty()) {
                ServiceLocator.getProdutoService().update(produto);
                mv = new ModelAndView("redirect:/estoque/produto/lista");
            //} else {
                //mv = new ModelAndView("/estoque/produto/form");
                mv.addObject("produto", produto);
              //  mv.addObject("errors", errors);
            //}
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }

   

   
     @RequestMapping(value = "/estoque/produto/{id}/excluir", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable Long id) {
        try {
            ServiceLocator.getProdutoService().delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        ModelAndView mv = new ModelAndView("redirect:/estoque/produto/lista");
        return mv;
    }
    @RequestMapping (value = "/estoque/produto/lista", method = RequestMethod.GET)
    public ModelAndView readbyCriteria(String nome, Long offset){
        
        boolean redirect = false;
        if (offset == null || offset < 0) {
            offset = 0L;
            redirect = true;
        }
        
        List<Produto> produtoList = null;
        Map<Long, Object> criteria = new HashMap<Long, Object>();
        criteria.put(ProdutoCriteria.NOME_ILIKE, nome);
        Long count = 0L;
        
        String uri = "";
        
        if(nome != null && !nome.isEmpty()){
            uri +="nome="+nome;
        }
        uri +="&offset="+offset;
        try {
            produtoList = ServiceLocator.getProdutoService().readyByCriteria(criteria, offset);
            count = ServiceLocator.getProdutoService().countByCriteria(criteria);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        ModelAndView mv = null;
        
        if(redirect){
                mv = new ModelAndView("redirect:/estoque/produto/lista?" + uri);
            }else{
            mv = new ModelAndView("/estoque/produto/lista");
            mv.addObject("nome", nome);
            mv.addObject("produtoList", produtoList);
            mv.addObject("offset", offset);
            mv.addObject("count", count);
            String ativo = "produto";
            mv.addObject("ativo", ativo);
        }
                
        return mv;
        
    }
    
    

}
