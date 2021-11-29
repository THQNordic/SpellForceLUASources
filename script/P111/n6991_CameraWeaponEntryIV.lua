-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 526.886536 , 530.708618 , 36.294243 , 29.900078 , [[Camera:ScriptSplineLookAtPosition(510.184,537.299,34.411);]] )
   Camera:MotionSpline_AddSplinePoint( 527.371582 , 544.259277 , 38.137386 , 10.600004 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 518.775330 , 554.658508 , 41.989971 , 16.500027 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 505.317810 , 548.917725 , 45.716911 , 24.300056 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 499.566895 , 529.274597 , 46.496292 , 29.800077 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 505.323517 , 515.815674 , 46.647694 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.273438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
