-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 193.041534 , 484.480286 , 43.543209 , 11.900009 , [[Camera:ScriptSplineLookAtNpc(9251);]] )
   Camera:MotionSpline_AddSplinePoint( 208.405350 , 463.957367 , 43.183235 , 7.399995 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 203.695389 , 434.730286 , 42.843197 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 173.167908 , 419.986755 , 43.583179 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.742188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
