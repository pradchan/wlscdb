package io.helidon.bestbank.creditscore;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.json.Json;
import javax.json.JsonObject;

import io.helidon.webserver.Routing;
import io.helidon.webserver.ServerRequest;
import io.helidon.webserver.ServerResponse;
import io.helidon.webserver.Service;

/**
 *
 */

public class CreditscoreService implements Service {

	private final Logger logger = Logger.getLogger(this.getClass().getName());

	private static final int SCORE_MAX = 800;
	private static final int SCORE_MIN = 550;

	/**
	 * A service registers itself by updating the routine rules.
	 *
	 * @param rules the routing rules.
	 */
	@Override
	public final void update(final Routing.Rules rules) {
		rules
			.get("/healthcheck", this::getTestMessage)
			.post("/", this::postMethodCreditscore);
	}

    /**
     * Return a test greeting message.
     * @param request the server request
     * @param response the server response
     */
    private void getTestMessage(final ServerRequest request,
                                   final ServerResponse response) {

        JsonObject returnObject = Json.createObjectBuilder()
                .add("message", "The creditscore provider is running.")
                .build();
        response.send(returnObject);
    }

	/**
     * POST method to return a customer data including creditscore value, using the data that was provided.
     * @param request the server request
     * @param response the server response
     */
	private void postMethodCreditscore(final ServerRequest request,
            final ServerResponse response) {

		request.content()
		.as(JsonObject.class)
		.thenAccept(json -> {
		    logger.log(Level.INFO, "Request: {0}", json);
		    response.send(
		            Json.createObjectBuilder(json)
		                    .add("score", calculateCreditscore(json.getString("firstname"), json.getString("lastname"),
		            				json.getString("dateofbirth"), json.getString("ssn")))
		                    .build()
		    );
		});
	}

	/**
	 * calculate creditscore based on customer's properties
	 * @param firstname
	 * @param lastname
	 * @param dateofbirth
	 * @param ssn
	 * @return
	 */
	private int calculateCreditscore(String firstname, String lastname, String dateofbirth, String ssn) {

		int score = Math.abs(firstname.hashCode() + lastname.hashCode()
				+ dateofbirth.hashCode() + ssn.hashCode());

		score = score % SCORE_MAX;

		while (score < SCORE_MIN) {
			score = score + 100;
		}
		return score;
	}

}
