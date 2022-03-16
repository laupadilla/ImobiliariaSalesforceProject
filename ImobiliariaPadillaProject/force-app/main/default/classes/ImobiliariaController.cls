public with sharing class ImobiliariaController {
    
    public Integer quartos {get; set;}
    public Integer banheiros {get; set;}
    public Integer salas {get; set;}
    public Integer cozinhas {get; set;}
    public Integer copas {get; set;}
    public Integer suites {get; set;}
    public Integer vagas {get; set;}
    public Integer valor {get; set;}
    public String tipoImovel {get; set;}


    public List<SelectOption> getMinhasOpcoes(){

        Schema.DescribeFieldResult describeResult = Imovel__c.Tipo_do_Imovel__c.getDescribe();

        List<Schema.PicklistEntry> entries = describeResult.getPicklistValues();

        List<SelectOption> optionsReturn = new List<SelectOption>();

        for(Schema.PicklistEntry pEntry: entries){
            if(pEntry.isActive()){
                optionsReturn.add(new SelectOption(pEntry.getValue(), pEntry.getLabel()));
            }
        }

        return optionsReturn;

    }


    public void salvar(){
        Imovel__c objImovel = new Imovel__c();
        
        objImovel.Quartos__c = quartos;
        objImovel.Banheiro__c = quartos;
        objImovel.Sala__c = salas;
        objImovel.Cozinha__c = cozinhas;
        objImovel.Copa__c = copas;
        objImovel.Suite__c = suites;
        objImovel.Garagem__c = vagas;
        objImovel.Valor__c = valor;
        objImovel.Tipo_do_Imovel__c = tipoImovel;

        

        try {
            
            if(objImovel.Tipo_do_Imovel__c != 'Nenhum' && objImovel != null){            
                insert objImovel;

                Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Imóvel cadastrado com sucesso!'));


                quartos = null;
                banheiros = null;
                salas = null;
                cozinhas = null;
                copas = null;
                suites = null;
                vagas = null;
                valor = null;
                tipoImovel = null;
            }
            else{
                Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'O campo tipo do imóvel deverá ser preenchido!'));
            }

        } catch (DmlException e) {
            Apexpages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'ERRO!'));
        }
    }

}
