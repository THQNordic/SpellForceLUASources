-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 115.292305 , 282.683960 , 20.769419 , 9.900002 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 138.687073 , 282.134460 , 20.670704 , 6.299996 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 159.770355 , 290.557281 , 20.379412 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 176.564026 , 300.408508 , 19.359179 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.742188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
